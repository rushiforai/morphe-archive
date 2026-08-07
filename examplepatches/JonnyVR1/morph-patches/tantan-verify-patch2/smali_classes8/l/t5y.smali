.class public final synthetic Ll/t5y;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/u5y;


# direct methods
.method public synthetic constructor <init>(Ll/u5y;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t5y;->a:Ll/u5y;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t5y;->a:Ll/u5y;

    invoke-static {p0}, Ll/u5y;->a(Ll/u5y;)V

    return-void
.end method
