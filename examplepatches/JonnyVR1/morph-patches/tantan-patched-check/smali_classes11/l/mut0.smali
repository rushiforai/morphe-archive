.class public final synthetic Ll/mut0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/put0;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/put0;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/mut0;->a:Ll/put0;

    .line 5
    .line 6
    iput p2, p0, Ll/mut0;->b:I

    .line 7
    .line 8
    iput p3, p0, Ll/mut0;->c:I

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/mut0;->a:Ll/put0;

    .line 2
    .line 3
    iget v1, p0, Ll/mut0;->b:I

    .line 4
    .line 5
    iget p0, p0, Ll/mut0;->c:I

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Ll/put0;->D(II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
