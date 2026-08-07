.class public final synthetic Ll/tgx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ugx;


# direct methods
.method public synthetic constructor <init>(Ll/ugx;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/tgx;->a:Ll/ugx;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tgx;->a:Ll/ugx;

    invoke-static {p0}, Ll/ugx;->b(Ll/ugx;)V

    return-void
.end method
