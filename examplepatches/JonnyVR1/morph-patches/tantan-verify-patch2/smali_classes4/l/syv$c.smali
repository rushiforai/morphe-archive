.class public Ll/syv$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/syv;->n(Ll/b3k0;II)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ll/b3k0;

.field public final synthetic b:I

.field public final synthetic c:I

.field public final synthetic d:Ll/syv;


# direct methods
.method public constructor <init>(Ll/syv;Ll/b3k0;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/syv$c;->d:Ll/syv;

    .line 2
    .line 3
    iput-object p2, p0, Ll/syv$c;->a:Ll/b3k0;

    .line 4
    .line 5
    iput p3, p0, Ll/syv$c;->b:I

    .line 6
    .line 7
    iput p4, p0, Ll/syv$c;->c:I

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/syv$c;->a:Ll/b3k0;

    .line 2
    .line 3
    iget v1, p0, Ll/syv$c;->b:I

    .line 4
    .line 5
    iget p0, p0, Ll/syv$c;->c:I

    .line 6
    .line 7
    invoke-virtual {v0, v1, p0}, Ll/b3k0;->a(II)V

    .line 8
    .line 9
    .line 10
    return-void
.end method
