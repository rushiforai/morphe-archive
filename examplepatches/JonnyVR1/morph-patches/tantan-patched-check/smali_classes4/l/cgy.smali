.class public final synthetic Ll/cgy;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hgy;


# direct methods
.method public synthetic constructor <init>(Ll/hgy;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/cgy;->a:Ll/hgy;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cgy;->a:Ll/hgy;

    invoke-static {p0}, Ll/hgy;->b(Ll/hgy;)V

    return-void
.end method
