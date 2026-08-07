precision highp float;
uniform sampler2D InputTextureSampler;
varying vec2 VSOutTexCoord;
uniform float TimeInterval;
uniform vec2 ViewportSize;
uniform vec2 centerLeft;
uniform vec2 centerRight;
uniform float radiusLeft;
uniform float radiusRight; 
uniform float scale;
void main() {
    vec2 textureCoordinate = VSOutTexCoord  * ViewportSize;
	vec2 centerLeftYReverse = vec2(centerLeft.x, ViewportSize.y - centerLeft.y);
	vec2 centerRightYReverse = vec2(centerRight.x, ViewportSize.y - centerRight.y);
    float distanceLeft = distance(centerLeftYReverse, textureCoordinate);
    if (distanceLeft < radiusLeft) {
        vec2 offset = textureCoordinate - centerLeftYReverse;
        float percent = 1.0 - ((radiusLeft - distanceLeft) / radiusLeft) * scale;
        percent = percent * percent;
        offset *= percent;
        gl_FragColor = texture2D(InputTextureSampler, (centerLeftYReverse + offset)/ViewportSize);
        return;
    }
    float distanceRight = distance(centerRightYReverse, textureCoordinate);
    if (distanceRight < radiusRight) {
        vec2 offset = textureCoordinate - centerRightYReverse; 
        float percent = 1.0 - ((radiusRight - distanceRight) / radiusRight) * scale; 
        percent = percent * percent; 
        offset *= percent; 
        gl_FragColor = texture2D(InputTextureSampler, (centerRightYReverse + offset)/ViewportSize); 
        return; 
    } 
    gl_FragColor = texture2D(InputTextureSampler, VSOutTexCoord); 
}