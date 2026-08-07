.class public final synthetic Ll/gqj0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hqj0;


# direct methods
.method public synthetic constructor <init>(Ll/hqj0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gqj0;->a:Ll/hqj0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gqj0;->a:Ll/hqj0;

    invoke-static {p0}, Ll/hqj0;->a(Ll/hqj0;)V

    return-void
.end method
