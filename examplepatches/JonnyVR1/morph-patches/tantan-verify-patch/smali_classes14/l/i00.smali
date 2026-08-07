.class public final synthetic Ll/i00;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/r00;


# direct methods
.method public synthetic constructor <init>(Ll/r00;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/i00;->a:Ll/r00;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/i00;->a:Ll/r00;

    invoke-static {p0}, Ll/r00;->X(Ll/r00;)V

    return-void
.end method
