.class public final synthetic Ll/nhl0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/yil0;

.field public final synthetic b:I

.field public final synthetic c:I


# direct methods
.method public synthetic constructor <init>(Ll/yil0;II)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ll/nhl0;->a:Ll/yil0;

    iput p2, p0, Ll/nhl0;->b:I

    iput p3, p0, Ll/nhl0;->c:I

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/nhl0;->a:Ll/yil0;

    iget v1, p0, Ll/nhl0;->b:I

    iget p0, p0, Ll/nhl0;->c:I

    invoke-static {v0, v1, p0}, Ll/yil0;->T(Ll/yil0;II)V

    return-void
.end method
