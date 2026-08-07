precision highp float;
uniform sampler2D InputTextureSampler;
varying vec2 VSOutTexCoord;
uniform float parameter;
uniform vec3 lowSkinThreshold;
uniform vec3 highSkinThreshold;
uniform vec2 ViewportSize; 
mediump float minstep = 3.5;

void main() {

    vec2 pixelOffset = 1.0 / ViewportSize;

    float xInc = minstep * pixelOffset.x;
    float yInc = minstep * pixelOffset.y;
    float epslone = 0.004*parameter*parameter;
    vec4 eps = vec4(epslone, epslone, epslone, epslone);
    vec4 meanI = vec4(0., 0., 0., 0.);
    vec4 meanII = vec4(0., 0., 0., 0.);
    vec4 tmpVec4;

    vec4 sourceColorVec4 = texture2D(InputTextureSampler,VSOutTexCoord);

    if (parameter < 0.01 || epslone <=0.){
         gl_FragColor = sourceColorVec4;
         return;
    }

    float m_r = sourceColorVec4.r;
    float m_g = sourceColorVec4.g;
    float m_b = sourceColorVec4.b;
    float m_max = max(m_r, max(m_g, m_b));
    float m_min = min(m_r, min(m_g, m_b));
    float r_low = lowSkinThreshold.x;
    float g_low = lowSkinThreshold.y;
    float b_low = lowSkinThreshold.z;
    float r_high = highSkinThreshold.x;
    float g_high = highSkinThreshold.y;
    float b_high = highSkinThreshold.z;

    if(!(r_low<=m_r  && g_low<=m_g &&  b_low<=m_b)) {
        gl_FragColor = sourceColorVec4 ;
        return;
    }
    
    tmpVec4 = texture2D(InputTextureSampler, vec2( VSOutTexCoord.x + (-float(4) * 0.5 * xInc) + float(0) * xInc, VSOutTexCoord.y + (-float(4) * 0.5 * yInc) + float(0) * yInc));
    meanI += tmpVec4;
    meanII += tmpVec4 * tmpVec4;
    
    tmpVec4 = texture2D(InputTextureSampler, vec2( VSOutTexCoord.x + (-float(4) * 0.5 * xInc) + float(0) * xInc, VSOutTexCoord.y + (-float(4) * 0.5 * yInc) + float(1) * yInc));
    meanI += tmpVec4;
    meanII += tmpVec4 * tmpVec4;
    
    tmpVec4 = texture2D(InputTextureSampler, vec2( VSOutTexCoord.x + (-float(4) * 0.5 * xInc) + float(0) * xInc, VSOutTexCoord.y + (-float(4) * 0.5 * yInc) + float(2) * yInc));
    meanI += tmpVec4;
    meanII += tmpVec4 * tmpVec4;

    tmpVec4 = texture2D(InputTextureSampler, vec2( VSOutTexCoord.x + (-float(4) * 0.5 * xInc) + float(0) * xInc, VSOutTexCoord.y + (-float(4) * 0.5 * yInc) + float(3) * yInc));
    meanI += tmpVec4;
    meanII += tmpVec4 * tmpVec4;

    tmpVec4 = texture2D(InputTextureSampler, vec2( VSOutTexCoord.x + (-float(4) * 0.5 * xInc) + float(1) * xInc, VSOutTexCoord.y + (-float(4) * 0.5 * yInc) + float(0) * yInc));
    meanI += tmpVec4;
    meanII += tmpVec4 * tmpVec4;

    tmpVec4 = texture2D(InputTextureSampler, vec2( VSOutTexCoord.x + (-float(4) * 0.5 * xInc) + float(1) * xInc, VSOutTexCoord.y + (-float(4) * 0.5 * yInc) + float(1) * yInc));
    meanI += tmpVec4;
    meanII += tmpVec4 * tmpVec4;

    tmpVec4 = texture2D(InputTextureSampler, vec2( VSOutTexCoord.x + (-float(4) * 0.5 * xInc) + float(1) * xInc, VSOutTexCoord.y + (-float(4) * 0.5 * yInc) + float(2) * yInc));
    meanI += tmpVec4;
    meanII += tmpVec4 * tmpVec4;

    tmpVec4 = texture2D(InputTextureSampler, vec2( VSOutTexCoord.x + (-float(4) * 0.5 * xInc) + float(1) * xInc, VSOutTexCoord.y + (-float(4) * 0.5 * yInc) + float(3) * yInc));
    meanI += tmpVec4;
    meanII += tmpVec4 * tmpVec4;

    tmpVec4 = texture2D(InputTextureSampler, vec2( VSOutTexCoord.x + (-float(4) * 0.5 * xInc) + float(2) * xInc, VSOutTexCoord.y + (-float(4) * 0.5 * yInc) + float(0) * yInc));
    meanI += tmpVec4;
    meanII += tmpVec4 * tmpVec4;

    tmpVec4 = texture2D(InputTextureSampler, vec2( VSOutTexCoord.x + (-float(4) * 0.5 * xInc) + float(2) * xInc, VSOutTexCoord.y + (-float(4) * 0.5 * yInc) + float(1) * yInc));
    meanI += tmpVec4;
    meanII += tmpVec4 * tmpVec4;

    tmpVec4 = texture2D(InputTextureSampler, vec2( VSOutTexCoord.x + (-float(4) * 0.5 * xInc) + float(2) * xInc, VSOutTexCoord.y + (-float(4) * 0.5 * yInc) + float(2) * yInc));
    meanI += tmpVec4;
    meanII += tmpVec4 * tmpVec4;

    tmpVec4 = texture2D(InputTextureSampler, vec2( VSOutTexCoord.x + (-float(4) * 0.5 * xInc) + float(2) * xInc, VSOutTexCoord.y + (-float(4) * 0.5 * yInc) + float(3) * yInc));
    meanI += tmpVec4;
    meanII += tmpVec4 * tmpVec4;

    tmpVec4 = texture2D(InputTextureSampler, vec2( VSOutTexCoord.x + (-float(4) * 0.5 * xInc) + float(3) * xInc, VSOutTexCoord.y + (-float(4) * 0.5 * yInc) + float(0) * yInc));
    meanI += tmpVec4;
    meanII += tmpVec4 * tmpVec4;

    tmpVec4 = texture2D(InputTextureSampler, vec2( VSOutTexCoord.x + (-float(4) * 0.5 * xInc) + float(3) * xInc, VSOutTexCoord.y + (-float(4) * 0.5 * yInc) + float(1) * yInc));
    meanI += tmpVec4;
    meanII += tmpVec4 * tmpVec4;

    tmpVec4 = texture2D(InputTextureSampler, vec2( VSOutTexCoord.x + (-float(4) * 0.5 * xInc) + float(3) * xInc,     VSOutTexCoord.y + (-float(4) * 0.5 * yInc) + float(2) * yInc));
    meanI += tmpVec4;   
    meanII += tmpVec4 * tmpVec4;

    tmpVec4 = texture2D(InputTextureSampler, vec2( VSOutTexCoord.x + (-float(4) * 0.5 * xInc) + float(3) * xInc, VSOutTexCoord.y + (-float(4) * 0.5 * yInc) + float(3) * yInc));
    meanI += tmpVec4;
    meanII += tmpVec4 * tmpVec4;

    meanI /= float(4 * 4);
    meanII /= float(4 * 4);

    tmpVec4 = meanII - meanI * meanI;
    vec4 temp2 = tmpVec4 + eps;
    if (temp2.x <= 0. || temp2.y <= 0. || temp2.z <= 0. || temp2.x > 1.0 || temp2.y > 1.0 || temp2.z > 1.0 ){
            gl_FragColor = sourceColorVec4;
    } else {
        vec4 a = tmpVec4 /temp2;
        vec4 b = meanI - a * meanI;
        gl_FragColor = a * sourceColorVec4 + b;
        gl_FragColor.w = sourceColorVec4.w;
    }
}
