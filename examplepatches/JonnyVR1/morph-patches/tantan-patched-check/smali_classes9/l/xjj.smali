.class public final synthetic Ll/xjj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/yjj;


# direct methods
.method public synthetic constructor <init>(Ll/yjj;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xjj;->a:Ll/yjj;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xjj;->a:Ll/yjj;

    invoke-static {p0}, Ll/yjj;->f0(Ll/yjj;)V

    return-void
.end method
