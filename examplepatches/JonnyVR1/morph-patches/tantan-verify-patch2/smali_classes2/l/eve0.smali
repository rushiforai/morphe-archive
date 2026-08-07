.class public Ll/eve0;
.super Ll/dr2;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/String;Ljava/lang/String;Ll/cl90;Ljava/lang/Object;Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;ZZLcom/facebook/imagepipeline/common/Priority;Ll/tjm;)V
    .locals 12

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object/from16 v5, p4

    move-object/from16 v6, p5

    move-object/from16 v7, p6

    move/from16 v8, p7

    move/from16 v9, p8

    move-object/from16 v10, p9

    move-object/from16 v11, p10

    .line 44
    invoke-direct/range {v0 .. v11}, Ll/dr2;-><init>(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;Ll/cl90;Ljava/lang/Object;Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;ZZLcom/facebook/imagepipeline/common/Priority;Ll/tjm;)V

    return-void
.end method

.method public constructor <init>(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/String;Ll/cl90;Ljava/lang/Object;Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;ZZLcom/facebook/imagepipeline/common/Priority;Ll/tjm;)V
    .locals 0

    .line 43
    invoke-direct/range {p0 .. p9}, Ll/dr2;-><init>(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/String;Ll/cl90;Ljava/lang/Object;Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;ZZLcom/facebook/imagepipeline/common/Priority;Ll/tjm;)V

    return-void
.end method

.method public constructor <init>(Lcom/facebook/imagepipeline/request/ImageRequest;Ll/yk90;)V
    .locals 11

    .line 1
    invoke-interface {p2}, Ll/yk90;->getId()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v2

    .line 5
    invoke-interface {p2}, Ll/yk90;->v()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    invoke-interface {p2}, Ll/yk90;->n()Ll/cl90;

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    invoke-interface {p2}, Ll/yk90;->k()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v5

    .line 17
    invoke-interface {p2}, Ll/yk90;->I()Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;

    .line 18
    .line 19
    .line 20
    move-result-object v6

    .line 21
    invoke-interface {p2}, Ll/yk90;->H()Z

    .line 22
    .line 23
    .line 24
    move-result v7

    .line 25
    invoke-interface {p2}, Ll/yk90;->F()Z

    .line 26
    .line 27
    .line 28
    move-result v8

    .line 29
    invoke-interface {p2}, Ll/yk90;->getPriority()Lcom/facebook/imagepipeline/common/Priority;

    .line 30
    .line 31
    .line 32
    move-result-object v9

    .line 33
    invoke-interface {p2}, Ll/yk90;->m()Ll/tjm;

    .line 34
    .line 35
    .line 36
    move-result-object v10

    .line 37
    move-object v0, p0

    .line 38
    move-object v1, p1

    .line 39
    invoke-direct/range {v0 .. v10}, Ll/eve0;-><init>(Lcom/facebook/imagepipeline/request/ImageRequest;Ljava/lang/String;Ljava/lang/String;Ll/cl90;Ljava/lang/Object;Lcom/facebook/imagepipeline/request/ImageRequest$RequestLevel;ZZLcom/facebook/imagepipeline/common/Priority;Ll/tjm;)V

    .line 40
    .line 41
    .line 42
    return-void
.end method
