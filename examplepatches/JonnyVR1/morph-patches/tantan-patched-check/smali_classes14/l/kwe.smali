.class public final synthetic Ll/kwe;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/mwe;


# direct methods
.method public synthetic constructor <init>(Ll/mwe;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/kwe;->a:Ll/mwe;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/kwe;->a:Ll/mwe;

    invoke-static {p0}, Ll/mwe;->w(Ll/mwe;)V

    return-void
.end method
