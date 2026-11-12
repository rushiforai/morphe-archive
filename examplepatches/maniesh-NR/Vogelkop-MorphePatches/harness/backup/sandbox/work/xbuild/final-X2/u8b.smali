.class public final Lu8b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/app/TimePickerDialog$OnTimeSetListener;


# instance fields
.field public final a:I

.field public final synthetic b:Ltn;


# direct methods
.method public constructor <init>(Ltn;I)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lu8b;->b:Ltn;

    iput p2, p0, Lu8b;->a:I

    return-void
.end method


# virtual methods
.method public final onTimeSet(Landroid/widget/TimePicker;II)V
    .registers 14

    const/4 v8, 0x0

    const/4 v9, 0x0

    iget-object v0, p0, Lu8b;->b:Ltn;

    iget v1, p0, Lu8b;->a:I

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v7, 0x0

    move v5, p2

    move v6, p3

    invoke-virtual/range {v0 .. v9}, Ltn;->I(IIIIIIIII)V

    return-void
.end method
