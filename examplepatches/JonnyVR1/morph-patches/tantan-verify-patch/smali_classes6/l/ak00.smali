.class public final synthetic Ll/ak00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/nk00;


# direct methods
.method public synthetic constructor <init>(Ll/nk00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/ak00;->a:Ll/nk00;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ak00;->a:Ll/nk00;

    invoke-virtual {p0}, Ll/nk00;->f1()V

    return-void
.end method
