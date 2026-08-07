.class public final synthetic Ll/wo30;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:Ll/xp30;


# direct methods
.method public synthetic constructor <init>(Ll/xp30;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wo30;->a:Ll/xp30;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wo30;->a:Ll/xp30;

    invoke-static {p0}, Ll/xp30;->F(Ll/xp30;)Lcom/p1/mobile/putong/core/newui/profile/ProfileItem;

    move-result-object p0

    return-object p0
.end method
