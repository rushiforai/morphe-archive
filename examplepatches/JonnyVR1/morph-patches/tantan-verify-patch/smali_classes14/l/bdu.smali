.class public final synthetic Ll/bdu;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/cdu;


# direct methods
.method public synthetic constructor <init>(Ll/cdu;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bdu;->a:Ll/cdu;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bdu;->a:Ll/cdu;

    invoke-static {p0}, Ll/cdu;->b(Ll/cdu;)V

    return-void
.end method
