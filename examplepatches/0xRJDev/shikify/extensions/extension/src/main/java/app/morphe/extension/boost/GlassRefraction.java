package app.morphe.extension.boost;

import android.graphics.Color;
import android.graphics.RenderEffect;
import android.graphics.RuntimeShader;

final class GlassRefraction {
    private final RuntimeShader shader=new RuntimeShader(
        "uniform shader image; uniform float2 origin; uniform float2 extent; uniform float corner; uniform float thickness; uniform float bend; uniform float3 tint; uniform float tintAmount;"+
        "float distanceToEdge(float2 point){float2 q=abs(point)-extent+corner;return length(max(q,0.0))+min(max(q.x,q.y),0.0)-corner;}"+
        "half4 main(float2 point){float2 local=point-origin-extent;float distance=distanceToEdge(local);float depth=max(-distance,0.0);if(distance>0.0 || depth>=thickness)return half4(0.0);"+
        "float2 normal=float2(distanceToEdge(local+float2(0.5,0))-distanceToEdge(local-float2(0.5,0)),distanceToEdge(local+float2(0,0.5))-distanceToEdge(local-float2(0,0.5)));normal/=max(length(normal),0.001);"+
        "float slope=clamp(1.0-depth/thickness,0.0,1.0);float3 surface=normalize(float3(normal*slope,sqrt(max(1.0-slope*slope,0.0))));"+
        "float3 ray=refract(float3(0.0,0.0,-1.0),surface,1.0/1.35);float height=sqrt(max(depth*(2.0*thickness-depth),0.0));"+
        "float travel=(min(height,thickness)+8.0*thickness)/max(-ray.z,0.05);float2 samplePoint=point+ray.xy*travel*bend;half4 colour=image.eval(samplePoint);"+
        "float coverage=0.65*(1.0-smoothstep(thickness*0.15,thickness,depth))*step(distance,0.0);"+
        "return half4(half3(mix(float3(colour.rgb),tint,tintAmount))*half(coverage),colour.a*half(coverage));}"
    );
    RenderEffect effect(float width,float height,float padding,float density,int colour){
        return effect(width,height,padding,density,colour,-1,height,0,0.4f);
    }
    RenderEffect effect(float width,float height,float padding,float density,int colour,float corner,float totalHeight,float offset,float tintAmount){
        shader.setFloatUniform("origin",padding/2,(padding-offset)/2);shader.setFloatUniform("extent",width/4,totalHeight/4);
        shader.setFloatUniform("corner",corner<0 ? Math.min(40*density,height/2)/2:corner);shader.setFloatUniform("thickness",Math.min(2f*density,totalHeight/20));shader.setFloatUniform("bend",0.14f);
        shader.setFloatUniform("tint",Color.red(colour)/255f,Color.green(colour)/255f,Color.blue(colour)/255f);
        shader.setFloatUniform("tintAmount",tintAmount);
        return RenderEffect.createRuntimeShaderEffect(shader,"image");
    }
}
