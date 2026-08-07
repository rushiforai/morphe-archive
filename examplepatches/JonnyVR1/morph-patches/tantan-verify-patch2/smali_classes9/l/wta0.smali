.class public final synthetic Ll/wta0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/zta0;


# direct methods
.method public synthetic constructor <init>(Ll/zta0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/wta0;->a:Ll/zta0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/wta0;->a:Ll/zta0;

    invoke-static {p0}, Ll/zta0;->e(Ll/zta0;)V

    return-void
.end method
