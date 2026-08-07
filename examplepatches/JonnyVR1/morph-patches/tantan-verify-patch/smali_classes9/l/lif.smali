.class public final synthetic Ll/lif;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pcj;


# instance fields
.field public final synthetic a:Ll/x1d0;


# direct methods
.method public synthetic constructor <init>(Ll/x1d0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/lif;->a:Ll/x1d0;

    return-void
.end method


# virtual methods
.method public final call()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/lif;->a:Ll/x1d0;

    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/profile/exploop/inputitem/ExpProfileLoopCustomSchoolTypeFrag;->W4(Ll/x1d0;)Ll/x1d0;

    move-result-object p0

    return-object p0
.end method
