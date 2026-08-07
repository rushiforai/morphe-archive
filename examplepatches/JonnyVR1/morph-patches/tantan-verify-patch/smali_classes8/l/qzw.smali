.class public final synthetic Ll/qzw;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/yzw;


# direct methods
.method public synthetic constructor <init>(Ll/yzw;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/qzw;->a:Ll/yzw;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/qzw;->a:Ll/yzw;

    invoke-static {p0}, Ll/yzw;->a(Ll/yzw;)V

    return-void
.end method
