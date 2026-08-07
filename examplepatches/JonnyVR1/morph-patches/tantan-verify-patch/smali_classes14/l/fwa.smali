.class public final synthetic Ll/fwa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/data/Relationship;

.field public final synthetic b:Ljava/lang/String;


# direct methods
.method public synthetic constructor <init>(Lcom/p1/mobile/putong/data/Relationship;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fwa;->a:Lcom/p1/mobile/putong/data/Relationship;

    iput-object p2, p0, Ll/fwa;->b:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fwa;->a:Lcom/p1/mobile/putong/data/Relationship;

    iget-object p0, p0, Ll/fwa;->b:Ljava/lang/String;

    invoke-static {v0, p0}, Lcom/p1/mobile/putong/core/api/y;->e3(Lcom/p1/mobile/putong/data/Relationship;Ljava/lang/String;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
