attribute vec3		Position0;
attribute vec2		Texcoord0;
varying vec2		VSOutTexCoord;

uniform vec2 ViewportSize;
uniform float MovePointNum;
uniform float RigidAlpha;
uniform float Intensity;
uniform float FaceDetected;//<=0 means no faces

const int MAX_ANCHOR_POINT_NUM = 112;//94+8 
uniform vec2 DstDotL[MAX_ANCHOR_POINT_NUM]; //deformed points
uniform vec2 SrcDotL[MAX_ANCHOR_POINT_NUM]; //origin points

vec2 GetMLSUV(vec2 uv)
{
	int k = 0;
    int point_num = int(MovePointNum);
    vec2 scaleVpSize = ViewportSize;
    float dPosX = uv.x * scaleVpSize.x;
    float dPosY = uv.y * scaleVpSize.y;
    float w[MAX_ANCHOR_POINT_NUM];
    vec2 dPos = vec2(dPosX, dPosY);
    vec2 swq, qstar, newP, tmpP;
	vec2 swp, pstar, curV, curVJ, Pi, PiJ, Qi;
    vec2 dstDotL, srcDotL;
	float sw;
	float miu_r;

    if(point_num < 2){
        return uv;
    }

    // uv.y = 1.0 - uv.y;
	sw = 0.;
	swp.x = swp.y = 0.;
	swq.x = swq.y = 0.;
	newP.x = newP.y = 0.;
	curV.x = dPosX;
	curV.y = dPosY;

	for (k = 0; k < point_num; k++)// 对每个移动的点
	{
        dstDotL = DstDotL[k];
        srcDotL = SrcDotL[k];
		// if (dstDotL.x == dPosX && dstDotL.y == dPosY)
        if(length(dPos-dstDotL) < 1.e-1)
		{
			break;
		}
		float d_square = ((dPosX - dstDotL.x) * (dPosX - dstDotL.x) + (dPosY - dstDotL.y) * (dPosY - dstDotL.y));
		if (RigidAlpha == 1.0)  // alpha越强，图像跟点走的趋势越相近
		{
			w[k] = 1.0 / d_square;
		}
		else
		{
			w[k] = 1.0 / pow(d_square, RigidAlpha);
		}
		sw = sw + w[k];
		swp.x = swp.x + w[k] * dstDotL.x;
		swp.y = swp.y + w[k] * dstDotL.y;
		swq.x = swq.x + w[k] * srcDotL.x;
		swq.y = swq.y + w[k] * srcDotL.y;
	}
	if (k == point_num)
	{
		pstar.x = (1.0 / sw) * swp.x;
		pstar.y = (1.0 / sw) * swp.y;
		qstar.x = (1.0 / sw) * swq.x;
		qstar.y = (1.0 / sw) * swq.y;
		float s1 = 0.;
        float s2 = 0.;
		for (k = 0; k < point_num; k++)
		{
            dstDotL = DstDotL[k];
            srcDotL = SrcDotL[k];
			// if (dstDotL.x == dPosX && dstDotL.y == dPosY)
            if(length(dPos-dstDotL) < 1.e-1)
			{
				continue;
			}
			Pi.x = dstDotL.x - pstar.x;
			Pi.y = dstDotL.y - pstar.y;
			PiJ.x = -Pi.y, PiJ.y = Pi.x;
			Qi.x = srcDotL.x - qstar.x;
			Qi.y = srcDotL.y - qstar.y;
			s1 += w[k] * dot(Qi, Pi);
			s2 += w[k] * dot(Qi, PiJ);
		}
		miu_r = sqrt(s1 * s1 + s2 * s2);
		curV = curV - pstar;
		curVJ.x = -curV.y, curVJ.y = curV.x;
		for (k = 0; k < point_num; k++)
		{
            dstDotL = DstDotL[k];
            srcDotL = SrcDotL[k];
			// if (dstDotL.x == dPosX && dstDotL.y == dPosY)
            if(length(dPos-dstDotL) < 1.e-1)
			{
				continue;
			}
			Pi.x = dstDotL.x - pstar.x;
			Pi.y = dstDotL.y - pstar.y;
			PiJ.x = -Pi.y, PiJ.y = Pi.x;

			tmpP.x = dot(Pi, curV) * srcDotL.x - dot(PiJ, curV) * srcDotL.y;
			tmpP.y = dot(-Pi, curVJ) * srcDotL.x + dot(PiJ, curVJ) * srcDotL.y;
			tmpP = tmpP * (w[k] / miu_r);
			newP = newP + tmpP;
		}
		newP = newP + qstar;
	}
	else
	{
        srcDotL = SrcDotL[k];
		newP.x = srcDotL.x;
		newP.y = srcDotL.y;
	}
    
    vec2 deformedPos = vec2(dPosX + (newP.x - dPosX) * Intensity, dPosY + (newP.y - dPosY) * Intensity);//delta
    deformedPos /= scaleVpSize;
	return deformedPos;
}


void main(void)
{
	vec2 uv = Texcoord0;
    vec2 deformedUV = (FaceDetected > 0.? GetMLSUV(uv): uv);
#ifdef GLTEXTURE_FLIP_Y
    deformedUV.y = 1.0 - deformedUV.y;
#endif
	gl_Position = vec4(Position0.xy, 0.0, 1.0);
	VSOutTexCoord = deformedUV;
}