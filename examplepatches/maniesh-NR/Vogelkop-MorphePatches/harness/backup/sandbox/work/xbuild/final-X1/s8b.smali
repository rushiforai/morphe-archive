.class public final Ls8b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/DatePickerDialog$OnDateSetListener;


# instance fields
.field public final a:I

.field public final synthetic b:Ltn;


# direct methods
.method public constructor <init>(Ltn;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Ls8b;->b:Ltn;

    iput p2, p0, Ls8b;->a:I

    return-void
.end method


# virtual methods
.method public final onDateSet(Landroid/widget/DatePicker;III)V
    .registers 15

    const/4 v8, 0x0

    const/4 v9, 0x0

    iget-object v0, p0, Ls8b;->b:Ltn;

    iget v1, p0, Ls8b;->a:I

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move v2, p2

    move v3, p3

    move v4, p4

    invoke-virtual/range {v0 .. v9}, Ltn;->I(IIIIIIIII)V

    return-void
.end method
