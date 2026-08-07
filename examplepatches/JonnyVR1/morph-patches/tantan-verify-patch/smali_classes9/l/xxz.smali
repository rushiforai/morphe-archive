.class public final synthetic Ll/xxz;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/yxz;


# direct methods
.method public synthetic constructor <init>(Ll/yxz;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xxz;->a:Ll/yxz;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xxz;->a:Ll/yxz;

    invoke-static {p0}, Ll/yxz;->G2(Ll/yxz;)V

    return-void
.end method
