.class public final synthetic Ll/vgf0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/x20;


# instance fields
.field public final synthetic a:Ll/zif0;

.field public final synthetic b:Lcom/p1/mobile/putong/data/Gender;

.field public final synthetic c:Ll/x20;


# direct methods
.method public synthetic constructor <init>(Ll/zif0;Lcom/p1/mobile/putong/data/Gender;Ll/x20;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/vgf0;->a:Ll/zif0;

    iput-object p2, p0, Ll/vgf0;->b:Lcom/p1/mobile/putong/data/Gender;

    iput-object p3, p0, Ll/vgf0;->c:Ll/x20;

    return-void
.end method


# virtual methods
.method public final call()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vgf0;->a:Ll/zif0;

    iget-object v1, p0, Ll/vgf0;->b:Lcom/p1/mobile/putong/data/Gender;

    iget-object p0, p0, Ll/vgf0;->c:Ll/x20;

    invoke-static {v0, v1, p0}, Ll/zif0;->d0(Ll/zif0;Lcom/p1/mobile/putong/data/Gender;Ll/x20;)V

    return-void
.end method
