#define MAX_STEP 10

precision highp float;
uniform sampler2D InputTextureSampler;
uniform sampler2D InputBeautySampler;
varying vec2 VSOutTexCoord;

uniform vec2 ViewportSize;
uniform float stepCount;

uniform float intensityX[MAX_STEP];
uniform float intensityY[MAX_STEP];
uniform float circleCenterX[MAX_STEP];
uniform float circleCenterY[MAX_STEP];
uniform float circleSizeX[MAX_STEP];
uniform float circleSizeY[MAX_STEP];
uniform float circleType[MAX_STEP];

uniform float m[MAX_STEP*9];

float fix_det(mat2 matrix) {
    return matrix[0].x * matrix[1].y - matrix[0].y * matrix[1].x;
}

highp mat3 fix_transpose(in highp mat3 inMatrix) {
    highp vec3 i0 = inMatrix[0];
    highp vec3 i1 = inMatrix[1];
    highp vec3 i2 = inMatrix[2];

    highp mat3 outMatrix = mat3(
                 vec3(i0.x, i1.x, i2.x),
                 vec3(i0.y, i1.y, i2.y),
                 vec3(i0.z, i1.z, i2.z));
    return outMatrix;
}

mat3 fix_inverse(mat3 matrix) {
    vec3 row0 = matrix[0];
    vec3 row1 = matrix[1];
    vec3 row2 = matrix[2];

    vec3 minors0 = vec3(
        fix_det(mat2(row1.y, row1.z, row2.y, row2.z)),
        fix_det(mat2(row1.z, row1.x, row2.z, row2.x)),
        fix_det(mat2(row1.x, row1.y, row2.x, row2.y))
    );
    vec3 minors1 = vec3(
        fix_det(mat2(row2.y, row2.z, row0.y, row0.z)),
        fix_det(mat2(row2.z, row2.x, row0.z, row0.x)),
        fix_det(mat2(row2.x, row2.y, row0.x, row0.y))
    );
    vec3 minors2 = vec3(
        fix_det(mat2(row0.y, row0.z, row1.y, row1.z)),
        fix_det(mat2(row0.z, row0.x, row1.z, row1.x)),
        fix_det(mat2(row0.x, row0.y, row1.x, row1.y))
    );

    mat3 adj = fix_transpose(mat3(minors0, minors1, minors2));

    return (1.0 / dot(row0, minors0)) * adj;
}

vec2 get_cubic_bezier_curve(in vec2 p_begin, in vec2 p_end, in vec2 c_t1, in vec2 c_t2, in float t) {
    vec2 q0 = mix(p_begin, c_t1, t);
    vec2 q1 = mix(c_t1, c_t2, t);
    vec2 q2 = mix(c_t2, p_end, t);

    vec2 r0 = mix(q0, q1, t);
    vec2 r1 = mix(q1, q2, t);

    return mix(r0, r1, t);
}

float sdfEllipse(vec2 coord, vec2 center, float a, float b) {
    float a2 = a * a;
    float b2 = b * b;
    float result = (b2 * (coord.x - center.x) * (coord.x - center.x) +
    a2 * (coord.y - center.y) * (coord.y - center.y) - a2 * b2) / (a2 * b2);
    return 1.0 - result;
}

float ellipse_center_distance(vec2 p, vec2 c, float a, float b) {
    float k = (p.y - c.y) / (p.x - c.x);
    float m = p.y - p.x * k;
    float bb = pow(b, 2.) + 0.00001;
    float aa = pow(a, 2.) + 0.00001;
    float kk = pow(k, 2.);

    float x = c.x + sqrt(1./(1./aa + kk/bb));
    float y = k*x+m;
    return distance(vec2(x,y), c);
}

float ellipsev2(vec2 p, vec2 c, float a, float b) {
    bool flag = distance(p, c) < ellipse_center_distance(p, c, a, b);
    return float(flag);
}

highp vec2 localScale(float circleType, vec2 centerPostion, vec2 currentPosition, float radiusX, float radiusY, float intensityX, float intensityY, out bool inCircle) {
    vec2 offset = currentPosition - centerPostion;
    float dis = distance(currentPosition, centerPostion);
    float radius = ellipse_center_distance(currentPosition, centerPostion, radiusX, radiusY);
    if (circleType == 1.) {
        if (currentPosition.y > centerPostion.y) {
            dis = distance(vec2(centerPostion.x, currentPosition.y), centerPostion);
            radius = distance(vec2(centerPostion.x, currentPosition.y), centerPostion);
        }
    } else if (circleType == 2.) {
        if (currentPosition.y < centerPostion.y) {
            dis = distance(vec2(centerPostion.x, currentPosition.y), centerPostion);
            radius = distance(vec2(centerPostion.x, currentPosition.y), centerPostion);
        }
    } else if (circleType == 3.) {
        if (currentPosition.x > centerPostion.x) {
            dis = distance(vec2(centerPostion.x, currentPosition.y), centerPostion);
            radius = distance(vec2(centerPostion.x, currentPosition.y), centerPostion);
        }
    } else if (circleType == 4.) {
        if (currentPosition.x < centerPostion.x) {
            dis = distance(vec2(centerPostion.x, currentPosition.y), centerPostion);
            radius = distance(vec2(centerPostion.x, currentPosition.y), centerPostion);
        }
    }

    if(dis < radius) {
        inCircle = true;

        float CV_PI = 3.1415926535897;
        float rnorm = dis / radius;
        float Kx, Ky, k_x, k_y;
        float invIntensityX = 1.0 - abs(intensityX);
        float invIntensityY = 1.0 - abs(intensityY);
        float stepIntensityX = step(0., -intensityX);
        float stepIntensityY = step(0., -intensityY);
        k_x = 0.44 * cos(invIntensityX * CV_PI / 2.0);
        k_y = 0.44 * cos(invIntensityY * CV_PI / 2.0);
        Kx = max(float(pow(rnorm - k_x, 3.0) * (abs(intensityX) / pow(1.0 - k_x, 3.0)) + invIntensityX), invIntensityX);
        Ky = max(float(pow(rnorm - k_y, 3.0) * (abs(intensityY) / pow(1.0 - k_y, 3.0)) + invIntensityY), invIntensityY);
        vec2 alpha_1 = vec2(stepIntensityX - (2.0 * stepIntensityX - 1.0) * Kx, stepIntensityY - (2.0 * stepIntensityY - 1.0) * Ky);
        vec2 alpha_2 = vec2(stepIntensityX, stepIntensityY);

        return centerPostion + alpha_1 * offset + alpha_2 * (currentPosition - centerPostion);

    }
    return currentPosition;
}

void main() {
    vec2 curCoord = VSOutTexCoord.xy * ViewportSize;
    #ifdef GLTEXTURE_FLIP_Y
        curCoord = vec2(VSOutTexCoord.x, 1.0 - VSOutTexCoord.y) * ViewportSize;
    #endif 
    bool curIncircle = false;
    for (int i = 0; i < int(stepCount); i++) {
        int matI = i * 9;
        mat3 transposeMat = mat3(m[matI], m[matI+1], m[matI+2], m[matI+3], m[matI+4], m[matI+5], m[matI+6], m[matI+7], m[matI+8]);
        mat3 invTransposeMat = fix_inverse(transposeMat);
        vec2 textureCoordinateRot = (transposeMat * vec3(curCoord, 1.0)).xy;

        bool inCircle = false;
        vec2 coordLocalScale = localScale(circleType[i], vec2(circleCenterX[i], circleCenterY[i]), textureCoordinateRot, circleSizeX[i], circleSizeY[i], intensityX[i], intensityY[i], inCircle);
        curCoord = (invTransposeMat * vec3(coordLocalScale, 1.0)).xy;

        curIncircle = curIncircle || inCircle;
    }
    
    vec2 resultCoord = curCoord / ViewportSize;
    #ifdef GLTEXTURE_FLIP_Y
        resultCoord.y = 1.0 - resultCoord.y;
    #endif 
    gl_FragColor = texture2D(InputBeautySampler, resultCoord);
}
