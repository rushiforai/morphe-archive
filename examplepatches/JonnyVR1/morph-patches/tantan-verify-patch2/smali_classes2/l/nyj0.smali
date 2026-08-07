.class public Ll/nyj0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/m7m;


# direct methods
.method public constructor <init>(Ll/m7m;)V
    .locals 0
    .param p1    # Ll/m7m;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RestrictTo;
        value = {
            .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY:Landroidx/annotation/RestrictTo$Scope;
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/nyj0;->a:Ll/m7m;

    .line 5
    .line 6
    return-void
.end method
