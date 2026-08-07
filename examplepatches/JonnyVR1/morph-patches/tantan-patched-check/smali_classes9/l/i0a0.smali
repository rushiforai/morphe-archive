.class public final synthetic Ll/i0a0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/p0a0;


# direct methods
.method public synthetic constructor <init>(Ll/p0a0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i0a0;->a:Ll/p0a0;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i0a0;->a:Ll/p0a0;

    check-cast p1, Lcom/p1/mobile/putong/data/SettingGroups;

    invoke-static {p0, p1}, Ll/p0a0;->X(Ll/p0a0;Lcom/p1/mobile/putong/data/SettingGroups;)V

    return-void
.end method
