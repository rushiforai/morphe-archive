.class public final synthetic Ll/t010;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/c110;


# direct methods
.method public synthetic constructor <init>(Ll/c110;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/t010;->a:Ll/c110;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/t010;->a:Ll/c110;

    invoke-static {p0}, Ll/c110;->l(Ll/c110;)V

    return-void
.end method
