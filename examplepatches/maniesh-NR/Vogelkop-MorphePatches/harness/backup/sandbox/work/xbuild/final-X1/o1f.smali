.class public final synthetic Lo1f;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lt1f;


# instance fields
.field public final synthetic a:Lv1f;

.field public final synthetic b:I


# direct methods
.method public synthetic constructor <init>(Lv1f;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lo1f;->a:Lv1f;

    iput p2, p0, Lo1f;->b:I

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 3

    iget-object v0, p0, Lo1f;->a:Lv1f;

    iget p0, p0, Lo1f;->b:I

    invoke-virtual {v0, p0, p1}, Lv1f;->d(IZ)V

    return-void
.end method
