.class public final synthetic Ll/qyz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/qzz;


# direct methods
.method public synthetic constructor <init>(Ll/qzz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qyz;->a:Ll/qzz;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qyz;->a:Ll/qzz;

    check-cast p1, Lcom/p1/mobile/putong/data/SettingGroups;

    invoke-static {p0, p1}, Ll/qzz;->v(Ll/qzz;Lcom/p1/mobile/putong/data/SettingGroups;)V

    return-void
.end method
