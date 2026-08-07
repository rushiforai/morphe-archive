.class public final synthetic Ll/iib;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/dkb;

.field public final synthetic b:Lcom/p1/mobile/putong/data/UserSettingPatch;


# direct methods
.method public synthetic constructor <init>(Ll/dkb;Lcom/p1/mobile/putong/data/UserSettingPatch;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iib;->a:Ll/dkb;

    iput-object p2, p0, Ll/iib;->b:Lcom/p1/mobile/putong/data/UserSettingPatch;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/iib;->a:Ll/dkb;

    iget-object p0, p0, Ll/iib;->b:Lcom/p1/mobile/putong/data/UserSettingPatch;

    invoke-static {v0, p0}, Ll/dkb;->k6(Ll/dkb;Lcom/p1/mobile/putong/data/UserSettingPatch;)Lrx/c;

    move-result-object p0

    return-object p0
.end method
