.class public final synthetic Ll/wii;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/zii;


# direct methods
.method public synthetic constructor <init>(Ll/zii;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wii;->a:Ll/zii;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wii;->a:Ll/zii;

    invoke-static {p0}, Ll/zii;->a(Ll/zii;)V

    return-void
.end method
