.class public final synthetic Ll/tgj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/xgj;


# direct methods
.method public synthetic constructor <init>(Ll/xgj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tgj;->a:Ll/xgj;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tgj;->a:Ll/xgj;

    invoke-static {p0}, Ll/xgj;->b(Ll/xgj;)V

    return-void
.end method
