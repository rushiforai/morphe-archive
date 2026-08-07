.class public final synthetic Ll/k6g;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/m6g;


# direct methods
.method public synthetic constructor <init>(Ll/m6g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/k6g;->a:Ll/m6g;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/k6g;->a:Ll/m6g;

    invoke-static {p0}, Ll/m6g;->a(Ll/m6g;)V

    return-void
.end method
