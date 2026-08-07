.class public final synthetic Ll/bmi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/cmi;


# direct methods
.method public synthetic constructor <init>(Ll/cmi;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/bmi;->a:Ll/cmi;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/bmi;->a:Ll/cmi;

    invoke-static {p0}, Ll/cmi;->e(Ll/cmi;)V

    return-void
.end method
