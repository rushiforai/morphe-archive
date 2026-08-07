.class public interface abstract Lcom/alibaba/fastjson/spi/Module;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract createDeserializer(Lcom/alibaba/fastjson/parser/ParserConfig;Ljava/lang/Class;)Lcom/alibaba/fastjson/parser/deserializer/ObjectDeserializer;
.end method

.method public abstract createSerializer(Lcom/alibaba/fastjson/serializer/SerializeConfig;Ljava/lang/Class;)Lcom/alibaba/fastjson/serializer/ObjectSerializer;
.end method
