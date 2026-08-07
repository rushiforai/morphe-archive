.class public final Ll/pfg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/aug0;

.field public final synthetic b:Ll/bog0;

.field public final synthetic c:I


# direct methods
.method public constructor <init>(Ll/aug0;Ll/bog0;I)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/pfg0;->a:Ll/aug0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/pfg0;->b:Ll/bog0;

    .line 4
    .line 5
    iput p3, p0, Ll/pfg0;->c:I

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pfg0;->a:Ll/aug0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/aug0;->p:Ll/eog0;

    .line 4
    .line 5
    iget-object v1, p0, Ll/pfg0;->a:Ll/aug0;

    .line 6
    .line 7
    iget-object v2, p0, Ll/pfg0;->b:Ll/bog0;

    .line 8
    .line 9
    iget p0, p0, Ll/pfg0;->c:I

    .line 10
    .line 11
    invoke-virtual {v0, v1, v2, p0}, Ll/rkg0;->g(Ll/aug0;Ll/bog0;I)V

    .line 12
    .line 13
    .line 14
    return-void
.end method
