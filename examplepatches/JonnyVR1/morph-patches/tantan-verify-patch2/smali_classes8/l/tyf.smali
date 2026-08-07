.class public final synthetic Ll/tyf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uyf;


# direct methods
.method public synthetic constructor <init>(Ll/uyf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tyf;->a:Ll/uyf;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tyf;->a:Ll/uyf;

    invoke-static {p0}, Ll/uyf;->l(Ll/uyf;)V

    return-void
.end method
