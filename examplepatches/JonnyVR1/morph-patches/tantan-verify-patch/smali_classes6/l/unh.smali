.class public final synthetic Ll/unh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ynh;


# direct methods
.method public synthetic constructor <init>(Ll/ynh;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/unh;->a:Ll/ynh;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/unh;->a:Ll/ynh;

    invoke-static {p0}, Ll/ynh;->v0(Ll/ynh;)V

    return-void
.end method
