.class public final Ll/aar0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/to50;


# instance fields
.field public final synthetic a:Ll/yo50;


# direct methods
.method public constructor <init>(Ll/p9s0;Ll/yo50;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/aar0;->a:Ll/yo50;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final bridge synthetic onSuccess(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Ljava/lang/Void;

    .line 2
    .line 3
    iget-object p0, p0, Ll/aar0;->a:Ll/yo50;

    .line 4
    .line 5
    invoke-interface {p0}, Ll/yo50;->onCanceled()V

    .line 6
    .line 7
    .line 8
    return-void
.end method
