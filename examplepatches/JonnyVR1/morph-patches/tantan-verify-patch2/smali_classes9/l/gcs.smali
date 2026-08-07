.class public final synthetic Ll/gcs;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hcs;


# direct methods
.method public synthetic constructor <init>(Ll/hcs;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/gcs;->a:Ll/hcs;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/gcs;->a:Ll/hcs;

    invoke-static {p0}, Ll/hcs;->J3(Ll/hcs;)V

    return-void
.end method
