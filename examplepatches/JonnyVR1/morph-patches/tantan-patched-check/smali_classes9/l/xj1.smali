.class public final synthetic Ll/xj1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ak1;


# direct methods
.method public synthetic constructor <init>(Ll/ak1;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/xj1;->a:Ll/ak1;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xj1;->a:Ll/ak1;

    invoke-static {p0}, Ll/ak1;->c(Ll/ak1;)V

    return-void
.end method
