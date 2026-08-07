//******************************************************************************

// @File         common_vs.glsl

// @Version       1.0

// @Created      2017, 3, 8

// @Description  This file is common_vs.glsl.

// @HISTORY:

//******************************************************************************/
#define XSaturate( x ) clamp(x, 0.0, 1.0)

float XMax( float a,  float b)
{
	return a > b ? a : b;
}

mat3 Inverse_mat3(mat3 m)
{
    float Determinant = 
          m[0][0] * (m[1][1] * m[2][2] - m[2][1] * m[1][2])
        - m[1][0] * (m[0][1] * m[2][2] - m[2][1] * m[0][2])
        + m[2][0] * (m[0][1] * m[1][2] - m[1][1] * m[0][2]);
    
    mat3 Inverse;
    Inverse[0][0] = + (m[1][1] * m[2][2] - m[2][1] * m[1][2]);
    Inverse[1][0] = - (m[1][0] * m[2][2] - m[2][0] * m[1][2]);
    Inverse[2][0] = + (m[1][0] * m[2][1] - m[2][0] * m[1][1]);
    Inverse[0][1] = - (m[0][1] * m[2][2] - m[2][1] * m[0][2]);
    Inverse[1][1] = + (m[0][0] * m[2][2] - m[2][0] * m[0][2]);
    Inverse[2][1] = - (m[0][0] * m[2][1] - m[2][0] * m[0][1]);
    Inverse[0][2] = + (m[0][1] * m[1][2] - m[1][1] * m[0][2]);
    Inverse[1][2] = - (m[0][0] * m[1][2] - m[1][0] * m[0][2]);
    Inverse[2][2] = + (m[0][0] * m[1][1] - m[1][0] * m[0][1]);
    Inverse /= Determinant;
    
    return Inverse;
}

mat3 Transpose_mat3(mat3 m)
{    
    mat3 transpose;
    transpose[0][0] = m[0][0];
	transpose[0][1] = m[1][0];
	transpose[0][2] = m[2][0];
	transpose[1][0] = m[0][1];
	transpose[1][1] = m[1][1];
	transpose[1][2] = m[2][1];
	transpose[2][0] = m[0][2];
	transpose[2][1] = m[1][2];
	transpose[2][2] = m[2][2];    
    return transpose;
}
