.class public final synthetic Ll/bws0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/eow0;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Ll/bqs0;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/String;Ll/bqs0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bws0;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/bws0;->b:Ll/bqs0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 1

    .line 1
    check-cast p1, Ll/cvs0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/bws0;->a:Ljava/lang/String;

    .line 4
    .line 5
    iget-object p0, p0, Ll/bws0;->b:Ll/bqs0;

    .line 6
    .line 7
    invoke-interface {p1, v0, p0}, Ll/cvs0;->k0(Ljava/lang/String;Ll/bqs0;)V

    .line 8
    .line 9
    .line 10
    return-object p1
.end method
