.class public Ll/otf;
.super Ll/bs2;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bs2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getFragmentShader()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "precision highp float;\n varying highp vec2 textureCoordinate;\n uniform sampler2D inputImageTexture0;\n uniform highp float iTime;\n uniform highp vec2 iResolution;\n highp vec3 N13(float p) {\n     highp vec3 p3 = fract(vec3(p) * vec3(.1031,.11369,.13787));\n     p3 += dot(p3, p3.yzx + 19.19);\n     return fract(vec3((p3.x + p3.y)*p3.z, (p3.x+p3.z)*p3.y, (p3.y+p3.z)*p3.x));\n }\n highp vec4 N14(float t) {\n     return fract(sin(t*vec4(123., 1024., 1456., 264.))*vec4(6547., 345., 8799., 1564.));\n }\n float N(float t) {\n     return fract(sin(t*12345.564)*7658.76);\n }\n float Saw(float b, float t) {\n     return smoothstep(0., b, t)*smoothstep(1., b, t);\n }\n highp vec2 DropLayer2(vec2 uv, float t) {\n     highp vec2 UV = uv;\n     uv.y += t*0.75;\n     highp vec2 a = vec2(6., 1.);\n     highp vec2 grid = a*2.;\n     highp vec2 id = floor(uv*grid);\n     float colShift = N(id.x);\n     uv.y += colShift;\n     id = floor(uv*grid);\n     highp vec3 n = N13(id.x*35.2+id.y*2376.1);\n     highp vec2 st = fract(uv*grid)-vec2(.5, 0);\n     float x = n.x-.5;\n     float y = UV.y*20.;\n     float wiggle = sin(y+sin(y));\n     x += wiggle*(.5-abs(x))*(n.z-.5);\n     x *= .7;\n     float ti = fract(t+n.z);\n     y = (Saw(.85, ti)-.5)*.9+.5;\n     highp vec2 p = vec2(x, y);\n     float d = length((st-p)*a.yx);\n     float mainDrop = smoothstep(.4, .0, d);\n     float r = sqrt(smoothstep(1., y, st.y));\n     float cd = abs(st.x-x);\n     float trail = smoothstep(.23*r, .15*r*r, cd);\n     float trailFront = smoothstep(-.02, .02, st.y-y);\n     trail *= trailFront*r*r;\n     y = UV.y;\n     float trail2 = smoothstep(.2*r, .0, cd);\n     float droplets = max(0., (sin(y*(1.-y)*120.)-st.y))*trail2*trailFront*n.z;\n     y = fract(y*10.)+(st.y-.5);\n     float dd = length(st-vec2(x, y));\n     droplets = smoothstep(.3, 0., dd);\n     float m = mainDrop+droplets*r*trailFront;\n     return vec2(m, trail);\n }\n float StaticDrops(highp vec2 uv, float t) {\n     uv *= 40.;\n     highp vec2 id = floor(uv);\n     uv = fract(uv)-.5;\n     highp vec3 n = N13(id.x*107.45+id.y*3543.654);\n     highp vec2 p = (n.xy-.5)*.7;\n     float d = length(uv-p);\n     float fade = Saw(.025, fract(t+n.z));\n     float c = smoothstep(.3, 0., d)*fract(n.z*10.)*fade;\n     return c;\n }\n highp vec2 Drops(highp vec2 uv, float t, float l0, float l1, float l2) {\n     uv = vec2(uv.x, 1.0 - uv.y);\n     float s = StaticDrops(uv, t)*l0;\n     highp vec2 m1 = DropLayer2(uv, t)*l1;\n     highp vec2 m2 = DropLayer2(uv*1.85, t)*l2;\n     float c = s+m1.x+m2.x;\n     c = smoothstep(.3, 1., c);\n     return vec2(c, max(m1.y*l0, m2.y*l1));\n }\n void main() {\n     highp vec2 UV = textureCoordinate;\n     highp vec2 uv = -(UV * iResolution -.5*iResolution.xy) / iResolution.y;\n     highp vec3 M = vec3(0.0);\n     float T = iTime+M.x*2.;\n     T = mod(iTime, 6.) + 6.;\n     T = mix(T, M.x*102., M.z>0.?1.:0.);\n     float t = T*.2;\n     float rainAmount = sin(T*.05)*.3+.7;\n     float maxBlur = mix(3., 6., rainAmount);\n     float minBlur = 2.;\n     float story = 0.;\n     float heart = 0.;\n     story = smoothstep(0., 70., T);\n     t = min(1., T/70.);\n     t = 1.-t;\n     t = (1.-t*t)*70.;\n     float zoom= mix(.3, 1.2, story);\n     uv *=zoom;\n     minBlur = 4.+smoothstep(.5, 1., story)*3.;\n     maxBlur = 6.+smoothstep(.5, 1., story)*1.5;\n     highp vec2 hv = uv-vec2(.0, -.1);\n     hv.x *= .5;\n     float s = smoothstep(110., 70., T);\n     hv.y-=sqrt(abs(hv.x))*.5*s;\n     heart = length(hv);\n     heart = smoothstep(.4*s, .2*s, heart)*s;\n     rainAmount = heart;\n     maxBlur-=heart;\n     uv *= 1.5;\n     t *= .25;\n     UV = (UV-.5)*(.9+zoom*.1)+.5;\n     float staticDrops = smoothstep(-.5, 1., rainAmount)*2.;\n     float layer1 = smoothstep(.25, .75, rainAmount);\n     float layer2 = smoothstep(.0, .5, rainAmount);\n     highp vec2 c = Drops(uv, t, staticDrops, layer1, layer2);\n     highp vec2 e = vec2(.001, 0.);\n     float cx = Drops(uv+e, t, staticDrops, layer1, layer2).x;\n     float cy = Drops(uv+e.yx, t, staticDrops, layer1, layer2).x;\n     highp vec2 n = vec2(cx-c.x, cy-c.x);\n     n *= 1.-smoothstep(60., 85., T);\n     c.y *= 1.-smoothstep(80., 100., T)*.8;\n     float focus = mix(maxBlur-c.y, minBlur, smoothstep(.1, .2, c.x));\n     highp vec3 col = texture2D(inputImageTexture0, UV+n, focus).rgb;\n     t = (T+3.)*.5;\n     float colFade = sin(t*.2)*.5+.5+story;\n     col *= mix(vec3(1.), vec3(.8, .9, 1.3), colFade);\n     float fade = smoothstep(0., 10., T);\n     float lightning = sin(t*sin(t*10.));\n     lightning *= pow(max(0., sin(t+sin(t))), 10.);\n     col *= 1.+lightning*fade*mix(1., .1, story*story);\n     col *= 1.-dot(UV-=.5, UV);\n     col = mix(pow(col, vec3(1.2)), col, heart);\n     fade *= smoothstep(102., 97., T);\n     col *= fade; gl_FragColor = vec4(col, 1.);\n }"

    .line 2
    .line 3
    return-object p0
.end method
