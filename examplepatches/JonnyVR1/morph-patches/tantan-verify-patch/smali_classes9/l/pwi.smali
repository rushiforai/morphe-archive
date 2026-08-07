.class public final synthetic Ll/pwi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/uwi;


# direct methods
.method public synthetic constructor <init>(Ll/uwi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/pwi;->a:Ll/uwi;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pwi;->a:Ll/uwi;

    invoke-virtual {p0}, Ll/uwi;->i()V

    return-void
.end method
