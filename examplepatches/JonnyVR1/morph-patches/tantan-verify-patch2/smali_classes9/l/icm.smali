.class public final synthetic Ll/icm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/kcm;


# direct methods
.method public synthetic constructor <init>(Ll/kcm;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/icm;->a:Ll/kcm;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/icm;->a:Ll/kcm;

    invoke-static {p0}, Ll/kcm;->a(Ll/kcm;)V

    return-void
.end method
