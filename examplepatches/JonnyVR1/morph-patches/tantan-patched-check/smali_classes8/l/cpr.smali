.class public final synthetic Ll/cpr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/dpr;


# direct methods
.method public synthetic constructor <init>(Ll/dpr;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cpr;->a:Ll/dpr;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cpr;->a:Ll/dpr;

    invoke-static {p0}, Ll/dpr;->a(Ll/dpr;)V

    return-void
.end method
