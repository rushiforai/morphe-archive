.class public final synthetic Ll/t000;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/h100;


# direct methods
.method public synthetic constructor <init>(Ll/h100;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t000;->a:Ll/h100;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t000;->a:Ll/h100;

    invoke-static {p0}, Ll/h100;->j(Ll/h100;)V

    return-void
.end method
