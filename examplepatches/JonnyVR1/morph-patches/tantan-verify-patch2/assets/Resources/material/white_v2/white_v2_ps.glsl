precision highp float;
varying vec2 VSOutTexCoord;
uniform sampler2D InputTextureSampler;
uniform sampler2D TextureLookup;
uniform sampler2D TextureLookupGray;
uniform float levelBlack;
uniform float levelRangeInv;
uniform float alpha;
void main()
 {
    vec3 colorOrigin = texture2D(InputTextureSampler,VSOutTexCoord).rgb;
    vec3 color = clamp((colorOrigin - vec3(levelBlack)) * levelRangeInv, 0.0, 1.0);
    vec3 texel;
    texel.r = texture2D(TextureLookupGray, vec2((color.r * 255.0 + 0.5) / 256.0, 0.5)).r;
    texel.g = texture2D(TextureLookupGray, vec2((color.g * 255.0 + 0.5) / 256.0, 0.5)).g;
    texel.b = texture2D(TextureLookupGray, vec2((color.b * 255.0 + 0.5) / 256.0, 0.5)).b;
    texel = mix(color, texel, 0.5);
    texel = mix(colorOrigin, texel, alpha);
    
    float blueColor = texel.b * 15.0;
    vec2 quad1, quad2;
    quad1.y = floor(floor(blueColor) * 0.25);
    quad1.x = floor(blueColor) - (quad1.y * 4.0);
    quad2.y = floor(ceil(blueColor) * 0.25);
    quad2.x = ceil(blueColor) - (quad2.y * 4.0);
    vec2 texPos2, texPos1;
    texPos2 = texel.rg * 0.234375 + 0.0078125;
    texPos1 = quad1 * 0.25 + texPos2;
    texPos2 = quad2 * 0.25 + texPos2;
    vec4 newColor1 = texture2D(TextureLookup, texPos1);
    vec4 newColor2 = texture2D(TextureLookup, texPos2);
	//vec4 newColorTest = texture2D(TextureLookupGray,VSOutTexCoord );
    color =  mix(newColor1.rgb, newColor2.rgb, fract(blueColor));
    color = mix(texel, color, 0.75);
    gl_FragColor = vec4(mix(colorOrigin, color, alpha), 1.0);
	// gl_FragColor = vec4(colorOrigin, 1.0);
}