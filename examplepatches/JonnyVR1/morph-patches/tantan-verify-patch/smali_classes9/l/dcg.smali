.class public final synthetic Ll/dcg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/y20;


# instance fields
.field public final synthetic a:Ll/ocg;


# direct methods
.method public synthetic constructor <init>(Ll/ocg;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/dcg;->a:Ll/ocg;

    return-void
.end method


# virtual methods
.method public final call(Ljava/lang/Object;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dcg;->a:Ll/ocg;

    check-cast p1, Ll/bcg;

    invoke-static {p0, p1}, Ll/ocg;->S3(Ll/ocg;Ll/bcg;)V

    return-void
.end method
