.class public final synthetic Ll/yv80;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/hw80;


# direct methods
.method public synthetic constructor <init>(Ll/hw80;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/yv80;->a:Ll/hw80;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yv80;->a:Ll/hw80;

    check-cast p1, Lcom/p1/mobile/putong/data/SettingGroups;

    invoke-static {p0, p1}, Ll/hw80;->u0(Ll/hw80;Lcom/p1/mobile/putong/data/SettingGroups;)V

    return-void
.end method
