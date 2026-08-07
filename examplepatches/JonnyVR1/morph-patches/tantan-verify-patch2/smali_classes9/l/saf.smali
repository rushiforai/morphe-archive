.class public final synthetic Ll/saf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/taf;


# direct methods
.method public synthetic constructor <init>(Ll/taf;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/saf;->a:Ll/taf;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/saf;->a:Ll/taf;

    invoke-static {p0}, Ll/taf;->b(Ll/taf;)V

    return-void
.end method
