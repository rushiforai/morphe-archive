.class public final synthetic Ll/fpo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/hpo;


# direct methods
.method public synthetic constructor <init>(Ll/hpo;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/fpo;->a:Ll/hpo;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fpo;->a:Ll/hpo;

    invoke-static {p0}, Ll/hpo;->x(Ll/hpo;)V

    return-void
.end method
