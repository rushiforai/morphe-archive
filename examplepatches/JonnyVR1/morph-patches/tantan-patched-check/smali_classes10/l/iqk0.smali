.class public final synthetic Ll/iqk0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/ark0;


# direct methods
.method public synthetic constructor <init>(Ll/ark0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/iqk0;->a:Ll/ark0;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/iqk0;->a:Ll/ark0;

    invoke-static {p0}, Ll/ark0;->O3(Ll/ark0;)V

    return-void
.end method
