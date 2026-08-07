.class public final Ll/vts0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bqs0;


# instance fields
.field public final a:Ll/bqs0;

.field public final synthetic b:Ll/wts0;


# direct methods
.method public constructor <init>(Ll/wts0;Ll/bqs0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vts0;->b:Ll/wts0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/vts0;->a:Ll/bqs0;

    .line 7
    .line 8
    return-void
.end method

.method public static bridge synthetic b(Ll/vts0;)Ll/bqs0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vts0;->a:Ll/bqs0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final bridge synthetic a(Ljava/lang/Object;Ljava/util/Map;)V
    .locals 0

    .line 1
    check-cast p1, Ll/wit0;

    .line 2
    .line 3
    iget-object p1, p0, Ll/vts0;->a:Ll/bqs0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/vts0;->b:Ll/wts0;

    .line 6
    .line 7
    invoke-interface {p1, p0, p2}, Ll/bqs0;->a(Ljava/lang/Object;Ljava/util/Map;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
